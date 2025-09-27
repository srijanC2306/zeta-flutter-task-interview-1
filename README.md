# Zeta Flutter Interview – Round 1  

This project is a Flutter implementation for **Zeta Interview Round 1**.  
It follows **Clean Architecture principles** with clear separation of layers, along with a basic UI integration.

---

## 🏗️ Project Architecture  

The project is divided into three main layers:  

### 1. **Domain Layer**  
- **Entities** → Core business models (e.g., `UserEntity`, `Info`, `Result`).  
- **Repository Abstraction** → Interface (`ZetaRepository`) defining contracts for data access.  

### 2. **Data Layer**  
- **DataSource** → Responsible for external communication (API calls using `http`).  
- **DTOs (Data Transfer Objects)** → JSON parsing classes (e.g., `UsersDto`, `InfoDto`, `ResultDto`).  
- **Repository Implementation** → (`ZetaRepositoryImpl`) connects DataSource with Domain, maps DTOs → Entities.  

### 3. **Presentation Layer**  
- **UI** → Simple screens consuming domain entities.  
- **State Management** → Minimal for now, ready for BLoC/Provider integration if required.  

---

## 🔌 API Used  

- [Random User API](https://randomuser.me/api)  
- Fetches sample user data and maps response into **Entities**.  

---

## 🧩 Code Highlights  

- **Clean Separation** → DTO ↔ Entity conversion handled via **extensions**.  
- **Error Handling** → `Error.throwWithStackTrace` used for consistent stack traces.  
- **Testability** → Repository and DataSource are abstracted for unit testing.  

---

## 📱 UI  

- Basic Flutter UI with:  
  - Vertical scrollable layout  
  - User information rendered from API response  
  - Ready for expansion (pagination, state management, animations).  

---

## ✅ Verification  

- ✅ Clean Architecture maintained  
- ✅ DTO ↔ Entity mapping implemented  
- ✅ Data Layer fully decoupled from UI  
- ✅ Error handling in place  
- ✅ API integrated successfully  

---

## 🚀 Next Steps (if time permits)  

- Add **unit tests** for Repository and DataSource  
- Implement **state management** (BLoC / Riverpod / Provider)  
- Enhance UI with pagination, loading states, and error states  

---

## 📂 Folder Structure  

